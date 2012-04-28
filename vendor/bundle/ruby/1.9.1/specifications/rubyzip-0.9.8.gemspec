# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{rubyzip}
  s.version = "0.9.8"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Alan Harper"]
  s.date = %q{2012-04-26}
  s.email = %q{alan@aussiegeek.net}
  s.files = ["samples/example.rb", "samples/example_filesystem.rb", "samples/example_recursive.rb", "samples/gtkRubyzip.rb", "samples/qtzip.rb", "samples/write_simple.rb", "samples/zipfind.rb", "lib/zip/compressor.rb", "lib/zip/constants.rb", "lib/zip/decompressor.rb", "lib/zip/deflater.rb", "lib/zip/dos_time.rb", "lib/zip/inflater.rb", "lib/zip/ioextras.rb", "lib/zip/null_compressor.rb", "lib/zip/null_decompressor.rb", "lib/zip/null_input_stream.rb", "lib/zip/pass_thru_compressor.rb", "lib/zip/pass_thru_decompressor.rb", "lib/zip/settings.rb", "lib/zip/tempfile_bugfixed.rb", "lib/zip/zip.rb", "lib/zip/zip_central_directory.rb", "lib/zip/zip_entry.rb", "lib/zip/zip_entry_set.rb", "lib/zip/zip_extra_field.rb", "lib/zip/zip_file.rb", "lib/zip/zip_input_stream.rb", "lib/zip/zip_output_stream.rb", "lib/zip/zip_streamable_directory.rb", "lib/zip/zip_streamable_stream.rb", "lib/zip/zipfilesystem.rb", "README.md", "NEWS", "TODO", "Rakefile"]
  s.homepage = %q{http://github.com/aussiegeek/rubyzip}
  s.require_paths = ["lib"]
  s.required_ruby_version = Gem::Requirement.new(">= 1.8.7")
  s.rubygems_version = %q{1.3.7}
  s.summary = %q{rubyzip is a ruby module for reading and writing zip files}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end
