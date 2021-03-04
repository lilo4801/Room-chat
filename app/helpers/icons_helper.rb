module IconsHelper
    def check_has_icon(message)
        
        hasUrl = []
        arrMes = message.split
        arrMes.each do |mes|
            icon = Icon.find_by(title: mes)
            if icon.present?
                hasUrl.push(icon.image_url(:thumb))
            else
                hasUrl.push(mes)
            end
        end
        
        return hasUrl
    end
end
