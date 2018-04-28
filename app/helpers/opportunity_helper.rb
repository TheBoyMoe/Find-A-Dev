module OpportunityHelper

  def prev_project_link(id)
    prev_id = id - 1;
    if(prev_id > 0)
      link_to 'Prev', opportunity_path(prev_id), id: "load-prev-project"
    end
  end

	def next_project_link(id)
    next_id = id + 1;
    if(next_id <= Opportunity.count)
      link_to 'Next', opportunity_path(next_id), id: "load-next-project"
    end
  end
end
