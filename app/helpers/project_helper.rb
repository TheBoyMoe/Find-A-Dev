module ProjectHelper

  def prev_project_link(id)
    prev_id = id - 1;
    if(prev_id > 0)
      link_to 'Previous', project_path(prev_id), id: "load-prev-project"
    end
  end

	def next_project_link(id)
    next_id = id + 1;
    if(next_id <= Project.count)
      link_to 'Next', project_path(next_id), id: "load-next-project"
    end
  end
end
