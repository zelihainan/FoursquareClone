# Projenin minimum iOS sürümünü NET belirle
platform :ios, '15.0'

target 'FoursquareClone' do
  use_frameworks!

  # Pods
  pod 'Parse'
end

# Tüm pod target'larına aynı deployment target'ı uygula
post_install do |installer|
  installer.pods_project.targets.each do |t|
    t.build_configurations.each do |config|
      config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '15.0'
    end
  end
end

