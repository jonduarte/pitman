class Pitman
  GEM_PATTERN = /([^ ]+)\s+\(.*\)/
  DEFAULT_GEMS = %w(bigdecimal io-console json minitest
                    psych rake rdoc test-unit)

  def self.gems_list
    extract_gems(`gem list`)
  end

  def self.parse(file)
    extract_gems(File.read(file))
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
    gems_list - (used + DEFAULT_GEMS)
  end

  def self.extract_gems(str)
    str.scan(/\s*#{GEM_PATTERN}/).flatten.uniq
  end
end
