module ApplicationHelper

  #sets Global app's name
	$APP_NAME = "سیستم مدیریت درخواست"

  #return full title
	def title(page_title)
		base_title = $APP_NAME
		if page_title.empty?
			provide(:title,base_title)
		else
			provide(:title,"#{page_title} | #{base_title}")
		end
	end

  def javascript(*files)
    content_for(:javascript){javascript_include_tag *files, 'data-turbolinks-track': 'reload' }
	end
	def javascript_end_page(*files) #todo add commit
		content_for(:javascript_end_page){javascript_include_tag *files, 'data-turbolinks-track': 'reload' }
	end
	def script(string) #todo add commit
		content_for(:script_end_page){ javascript_tag string }
	end
  def stylesheet(*files)
    content_for(:stylesheet){stylesheet_link_tag(*files , 'data-turbolinks-track': 'reload')}
  end
	def form_error(object)
		render partial: 'layouts/error_message',locals: {object:object}
	end

end
