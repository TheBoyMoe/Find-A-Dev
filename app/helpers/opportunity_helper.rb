module OpportunityHelper

  def prev_project_link(id)
    prev_id = id - 1;
    if(prev_id > 0 && prev_id <= Opportunity.count)
      link_to 'Previous Project', opportunity_path(prev_id), class: "load-project"
    end
  end
end
