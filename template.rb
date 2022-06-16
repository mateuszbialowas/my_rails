gem_group :development, :test do
  gem "rspec-rails"
  gem "faker"
  gem "factory_bot"
  gem 'rubocop'
  gem 'rubocop-minitest'
  gem 'rubocop-performance'
  gem 'rubocop-rails'
end

run "bundle install"

rails_command "generate rspec:install"

create_file '.rubocop.yml' do <<~YAML
  require:
    - rubocop-rails
    - rubocop-performance
    - rubocop-minitest

  inherit_mode:
    merge:
      - Exclude

  AllCops:
    Exclude:
      - 'lib/tasks/auto_annotate_models.rake'

  Bundler/OrderedGems:
    Enabled: true
    AutoCorrect: true
  Layout/EmptyLinesAroundAttributeAccessor:
    Enabled: true
  Layout/LineLength:
    Enabled: true
    AutoCorrect: true
  Layout/SpaceAroundMethodCallOperator:
    Enabled: true
  Lint/DeprecatedOpenSSLConstant:
    Enabled: true
  Lint/MixedRegexpCaptureTypes:
    Enabled: true
  Lint/RaiseException:
    Enabled: true
  Lint/StructNewOverride:
    Enabled: true
  Metrics/BlockLength:
    Enabled: true
    Exclude:
      - 'config/environments/development.rb'
  Performance/AncestorsInclude:
    Enabled: true
  Performance/BigDecimalWithNumericArgument:
    Enabled: true
  Performance/RedundantSortBlock:
    Enabled: true
  Performance/RedundantStringChars:
    Enabled: true
  Performance/ReverseFirst:
    Enabled: true
  Performance/SortReverse:
    Enabled: true
  Performance/Squeeze:
    Enabled: true
  Performance/StringInclude:
    Enabled: true
  Style/AccessorGrouping:
    Enabled: true
  Style/BisectedAttrAccessor:
    Enabled: true
  Style/ClassAndModuleChildren:
    Enabled: true
    AutoCorrect: true
  Style/Documentation:
    Enabled: false
  Style/ExponentialNotation:
    Enabled: true
  Style/HashEachMethods:
    Enabled: true
  Style/HashTransformKeys:
    Enabled: true
  Style/HashTransformValues:
    Enabled: true
  Style/RedundantAssignment:
    Enabled: true
  Style/RedundantFetchBlock:
    Enabled: true
  Style/RedundantRegexpCharacterClass:
    Enabled: true
  Style/RedundantRegexpEscape:
    Enabled: true
  Style/SlicingWithRange:
    Enabled: true
YAML
end

run "rubocop -A"

after_bundle do
  git :init
  git add: "."
  git commit: %Q{ -m 'Initial commit' }
end