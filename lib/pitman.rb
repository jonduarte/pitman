class Pitman
  DEFAULT_GEMS = %w(bigdecimal io-console json minitest
                    psych rake rdoc test-unit)

  def self.gems_list
    `gem list`.split("\n").collect { |str| str.split(" (").first.strip }
  end

  def self.parse(file)
    File.read(file)
      .split("\n")
      .select  { |str| str =~ /\(.+\)/ }
      .collect { |str| str.split(" ").first }
      .uniq
  end

  def self.used_gems(root)
    dirs = root.children.select { |c| c.directory? }

    gems = dirs.collect do |dir|
      Dir.chdir(dir) do
        next unless File.exist?('Gemfile.lock')
        parse('Gemfile.lock')
      end
    end

    gems.flatten
  end

  def self.collect(root)
    used = used_gems(root)
    all  = gems_list

    all - (used + DEFAULT_GEMS)
  end
end
