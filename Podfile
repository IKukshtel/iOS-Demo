# Uncomment this line to define a global platform for your project
platform :ios, '9.0'

target 'm2048' do
    # pod 'Amplitude-iOS', '~> 4.0.0'
    pod 'Amplitude-iOS', :git => 'https://github.com/Amplitude/Amplitude-iOS.git', :branch => 'hackathon'
#    pod 'Amplitude-iOS', :path => '~/repos/sdks/forked_ios/Amplitude-iOS'
    # pod 'Analytics' # Segment
end

post_install do |installer_representation|
    installer_representation.pods_project.targets.each do |target|
        target.build_configurations.each do |config|
            config.build_settings['GCC_PREPROCESSOR_DEFINITIONS'] ||= ['$(inherited)', 'AMPLITUDE_SSL_PINNING=1']
        end
    end
end
