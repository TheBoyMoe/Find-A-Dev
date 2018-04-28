module OpportunityHelper

  def prev_project_link(id)
    prev_id = id - 1;
    if(prev_id > 0 && prev_id <= Opportunity.count)
      link_to 'Next', opportunity_path(prev_id), id: "load-next-project"
    end
  end
end
