module ComplaintsHelper
  def top5_naggers
    Nagger.all.order('complaints_count desc').take(5)
  end

  def top5_complaints
    Complaint.all.order('loves_count desc').take(5)
  end
end
