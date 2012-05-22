require 'redmine'

require 'pygments_application_helper_patch'
require 'pygments_stylesheet_hook'
require 'syntax_highlighting_pygments'

Rails.configuration.to_prepare do
  require_dependency 'application_helper'
  ApplicationHelper.send(:include, PygmentsApplicationHelperPatch)
end

Redmine::Plugin.register :redmine_pygments do
  name 'Redmine Pygments plugin'
  author 'ichizok'
  description 'This is a plugin for Redmine'
  version '0.0.1'
  url 'https://bitbucket.org/ichizok/redmine_pygments'
  author_url 'https://bitbucket.org/ichizok'
end

Redmine::SyntaxHighlighting.highlighter = RedminePygments::SyntaxHighlighting::Pygments
