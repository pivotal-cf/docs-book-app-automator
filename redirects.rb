# Redirect all production http traffic to https
r301 %r{.*}, 'https://docs.pivotal.io$&', :if => Proc.new { |rack_env|
  rack_env['SERVER_NAME'] == 'docs.pivotal.io' && rack_env['HTTP_X_FORWARDED_PROTO'] == 'http'
}

# Redirects for docs-book-app-automator

r301 %r{/app-automator/(?![\d-]+)(.*)}, "/app-automator/1-0/$1"
