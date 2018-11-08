module ApplicationHelper
    def full_title(page_title)
        base_title = "こそだて広場"
        if page_title.empty?
            base_title
        else
            "#{base_title} ＊ #{page_title}"
        end
    end
    
    def bootstrap_class_for(flash_type)
        case flash_type
        when :success
            "alert-success"
        when :error
            "alert-danger"
        when :alert
            "alert-warning"
        when :nitice
            "alert-info"
        else
            flash_type.to_s
        end
    end
    
end
