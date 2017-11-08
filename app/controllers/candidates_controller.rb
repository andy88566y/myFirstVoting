class CandidatesController < ApplicationController
  before_action :find_candidate, only: [:edit, :update, :destroy, :vote]

  def index
    @candidates = Candidate.all  
  end

  def new
    @candidate = Candidate.new
  end

  def create
    @candidate = Candidate.new(candidate_params)

    if @candidate.save
      # 成功
      redirect_to candidates_path, notice: "新增候選人成功!"
    else
      # 失敗
      render :new
      #重新顯示已經填過資料那頁，而不是導一個新的頁面給使用者
      #
      #
      #
    
    end
  end


  def edit
  end

  def update
    if @candidate.update(candidate_params)
      # 成功
      redirect_to candidates_path, notice: "資料更新成功!"
    else
      # 失敗
      render :edit
    end
  end

  def vote
    @candidate.vote_logs.create(ip_address: request.remote_ip) if @candidate
    redirect_to candidates_path, notice: "完成投票!"
  end
  def method_name
    
  end
  
  def destroy
    @candidate.destroy if @candidate
    redirect_to candidates_path, notice: "候選人資料已刪除!"
  end

  private
  def candidate_params
    params.require(:candidate).permit(:name, :age, :party, :politics)
  end

  def find_candidate
    @candidate = Candidate.find_by(id: params[:id])
  end
end
