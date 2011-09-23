class NeuronsController < ApplicationController
  # GET /neurons
  # GET /neurons.json
  def index
    # render :json => Neuron.all.reverse
    
    puts "====="
    # puts File.readlines("public/neurons.json")
    # puts "====="
    # render :json => File.readlines("public/neurons.json")
    
    # 
    @neurons = Neuron.all.reverse
    puts @neurons.to_json
    render :json => @neurons
    # 
    
    # @neuron = Neuron.new
    # respond_to do |format|
    #   format.html # index.html.erb
    #   format.json { render json: @neurons }
    # end
  end

  # GET /neurons/1
  # GET /neurons/1.json
  def show
    render :json => Neuron.find(params[:id])
    # @neuron = Neuron.find(params[:id])
    # 
    # respond_to do |format|
    #   format.html # show.html.erb
    #   format.json { render json: @neuron }
    # end
  end

  # GET /neurons/new
  # GET /neurons/new.json
  def new
    @neuron = Neuron.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @neuron }
    end
  end

  # GET /neurons/1/edit
  def edit
    @neuron = Neuron.find(params[:id])
  end

  # POST /neurons
  # POST /neurons.json
  def create
    neuron = Neuron.create! params
    render :json => neuron
    # @neuron = Neuron.new(params[:neuron])
    # 
    # respond_to do |format|
    #   if @neuron.save
    #     format.html { redirect_to @neuron, notice: 'Neuron was successfully created.' }
    #     format.json { render json: @neuron, status: :created, location: @neuron }
    #   else
    #     format.html { render action: "new" }
    #     format.json { render json: @neuron.errors, status: :unprocessable_entity }
    #   end
    # end
  end

  # PUT /neurons/1
  # PUT /neurons/1.json
  def update
    neuron = Neuron.find(params[:id])

    neuron.update_attributes! params

    render :json => neuron
    # @neuron = Neuron.find(params[:id])
    # 
    # respond_to do |format|
    #   if @neuron.update_attributes(params[:neuron])
    #     format.html { redirect_to @neuron, notice: 'Neuron was successfully updated.' }
    #     format.json { head :ok }
    #   else
    #     format.html { render action: "edit" }
    #     format.json { render json: @neuron.errors, status: :unprocessable_entity }
    #   end
    # end
  end

  # DELETE /neurons/1
  # DELETE /neurons/1.json
  def destroy
    neuron = Neuron.find(params[:id])

    neuron.destroy

    render :json => neuron
    # @neuron = Neuron.find(params[:id])
    # @neuron.destroy
    # 
    # respond_to do |format|
    #   format.html { redirect_to neurons_url }
    #   format.json { head :ok }
    # end
  end
end
