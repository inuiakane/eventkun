class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy]
  before_action :is_editor, only: [:show, :edit, :update, :destroy]

  # GET /events
  # GET /events.json
  def index
    @events = Event.all
    @events = @events.where(is_public: 1).where("start_at >= ?", DateTime.now).order(:start_at)
  end

  # GET /events/1
  # GET /events/1.json
  def show
    @attends = @event.attends.all
    @attend = @event.attends.build
  end

  # GET /events/new
  def new
    @event = Event.new
    
  end

  # GET /events/1/edit
  def edit
  end

  # POST /events
  # POST /events.json
  def create
    @event = Event.new(event_params)
    @event.key = @event.create_key

    @event.session_id = session.id

    respond_to do |format|
      if @event.save
        format.html { redirect_to @event, notice: 'Event was successfully created.' }
        format.json { render :show, status: :created, location: @event }
      else
        format.html { render :new }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /events/1
  # PATCH/PUT /events/1.json
  def update
    respond_to do |format|
      if @event.update(event_params)
        format.html { redirect_to @event, notice: 'Event was successfully updated.' }
        format.json { render :show, status: :ok, location: @event }
      else
        format.html { render :edit }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /events/1
  # DELETE /events/1.json
  def destroy
    @event.destroy
    respond_to do |format|
      format.html { redirect_to events_url, notice: 'Event was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  
  def sendmail
    @mail = NoticeMailer.send_notice.deliver
    render text: "send finish"
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event
      #@event = Event.find(params[:id])
      @event = Event.find_by(key: params[:key]) || Event.find(params[:key])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def event_params
      params.require(:event).permit(:name, :info, :start_at, :end_at, :key, :is_public)
    end
  
    def is_editor
      @is_editor = (session.id == @event.session_id)
    end
  
end
