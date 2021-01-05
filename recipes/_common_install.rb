case node['platform_family']
when 'debian'
  # needed for uwsgi starting with version 1.3
  #  == 'ubuntu' && node['platform_version'] == '18.04'
  if node['platform']
    case node['platform_version']
    when '18.04'
        package 'libssl1.1'
    when '16.04'
        package "libssl1.0.0"
    else
        package "libssl0.9.8"
    end
  end
end

include_recipe 'build-essential::default'
