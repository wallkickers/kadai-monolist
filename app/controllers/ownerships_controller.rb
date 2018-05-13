class OwnershipsController < ApplicationController
  def create
    @item = Item.find_or_initialize_by(code: params[:item_code])
    
    unless @item.persisted?
      results = RakutenWebService::Ichiba::Item.search(itemCode: @item.code)
      
      @item = Item.new(read(results.first))
      @item.save
    end
    
    if params[:type] == "Want"
      current_user.want(@item)
      flash[:success] = "商品をwantしました"
    else
      current_user.have(@item)
      flash[:success] = "商品をhaveしました"
    end
    
    redirect_back(fallback_location: root_path)
  end

  def destroy
    @item = Item.find(params[:item_id])
    
    if params[:type] == "Want"
      current_user.unwant(@item)
      flash[:success] = "商品のwantを解除しました"
    else
      current_user.unhave(@item)
      flash[:success] = "商品のhaveを解除しました"
    end
    
    redirect_back(fallback_location: root_path)
    
  end
end

#:5 テーブルに@itemが保存されているかどうか判断。
#:6以下 アイテムの保存。wantが押された時点で、@item.codeから商品を抽出。resultsへ格納。
#:12以下 wantへ追加。"Want"により、タイプ「Want」を取得。