module ApplicationHelper

	#def render_login_logout_button
	#	if !user_signed_in?
	#		link_to("登入", admin_products_path)
	#	else
	#		link_to("登出", destroy_user_session_path, :method => "delete")
	#	end
	#end
	def distance_of_time_in_words(from_time, to_time = 0, include_seconds = false)
	    from_time = from_time.to_time if from_time.respond_to?(:to_time)
	    to_time = to_time.to_time if to_time.respond_to?(:to_time)
	    distance_in_minutes = (((to_time - from_time).abs)/60).round
	    distance_in_seconds = ((to_time - from_time).abs).round
	 
	    case distance_in_minutes
	        when 0..1
	            return (distance_in_minutes == 0) ? '不到 1 分鐘' : '1 分鐘' unless include_seconds
	        case distance_in_seconds
	            when 0..4   then '不到 5 秒'
	            when 5..9   then '不到 10 秒'
	            when 10..19 then '不到 20 秒'
	            when 20..39 then '半分鐘'
	            when 40..59 then '不到 1 分鐘'
	            else             '1 分鐘'
	        end
	 
	        when 2..44           then "#{distance_in_minutes} 分鐘"
	        when 45..89          then '大约 1 小時'
	        when 90..1439        then "大约 #{(distance_in_minutes.to_f / 60.0).round} 小時"
	        when 1440..2879      then '1 天'
	        when 2880..43199     then "#{(distance_in_minutes / 1440).round} 天"
	        when 43200..86399    then '大约 1 個月'
	        when 86400..525599   then "#{(distance_in_minutes / 43200).round} 個月"
	        when 525600..1051199 then '大約 1 年'
	    else                      "#{(distance_in_minutes / 525600).round} 年"
	   end
	end
	
end
