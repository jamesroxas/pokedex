# Uncomment the next line to define a global platform for your project
platform :ios, '9.3'

source 'https://bitbucket.org/FFUF/ffuf-ios-architecture.git'
source 'https://bitbucket.org/FFUF/ffuf-ios-architecture-fswiftnetworking.git'
source 'https://bitbucket.org/FFUF/ffuf-ios-architecture-fswiftparser.git'
source 'https://github.com/CocoaPods/Specs.git'

target 'swift4-pokedex' do
  # Comment the next line if you're not using Swift and don't want to use dynamic frameworks
  use_frameworks!

  # Pods for swift4-pokedex
  pod 'FFuFArchitecture'
#  pod 'FSwiftNetworking'
  pod 'SnapKit'
  pod 'IGListKit', :inhibit_warnings => true
  pod 'Rapid', :git => 'https://github.com/hooliooo/Rapid.git'


  target 'swift4-pokedexTests' do
    inherit! :search_paths
    # Pods for testing
  end

  target 'swift4-pokedexUITests' do
    inherit! :search_paths
    # Pods for testing
  end

end
