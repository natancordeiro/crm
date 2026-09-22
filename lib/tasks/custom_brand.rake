# [CUSTOM-TGN] aplica a identidade da TGN Technologies nas InstallationConfigs
namespace :custom do
  desc 'Aplica a marca da TGN Technologies'
  task brand: :environment do
    branding = {
      'INSTALLATION_NAME' => 'TGN Technologies',
      'LOGO'              => '/brand-assets/logo.svg',
      'LOGO_DARK'         => '/brand-assets/logo_dark.svg',
      'LOGO_THUMBNAIL'    => '/brand-assets/logo_thumbnail.svg',
      'LOGO_EMAIL'        => '/brand-assets/logo_email.png',
      'BRAND_URL'         => 'https://tgntechnologies.com.br',
      'WIDGET_BRAND_URL'  => 'https://tgntechnologies.com.br',
      'TERMS_URL'         => 'https://tgntechnologies.com.br/termos',
      'PRIVACY_URL'       => 'https://tgntechnologies.com.br/privacidade'
    }

    branding.each do |name, value|
      config = InstallationConfig.find_or_initialize_by(name: name)
      config.value  = value
      config.locked = false
      config.save!
      puts "  #{name} = #{value}"
    end

    GlobalConfig.clear_cache if GlobalConfig.respond_to?(:clear_cache)
    puts 'Marca TGN aplicada.'
  end
end