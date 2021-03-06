class OrdersController < ApplicationController
  def show
    @order = Order.find(params[:id])
    respond_to do |format|
      format.html
      format.pdf do
        pdf = OrderPdf.new(@order, view_context)
        send_data pdf.render,
          :filename => "order_#{@order.number}.pdf",
          :type => "application/pdf",
          :disposition => "inline"
      end
    end
  end
end
