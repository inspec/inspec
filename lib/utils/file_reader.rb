# encoding: utf-8
# author: ERAMOTO Masaya

module FileReader
  def read_file_content(path, allow_empty = false)
    # these are currently ResourceSkipped to maintain consistency with the resource
    # pre-refactor (which used skip_resource). These should likely be changed to
    # ResourceFailed during a major version bump.
    file = inspec.file(path)
    if !file.file?
      raise Inspec::Exceptions::ResourceSkipped, "Can't find file: #{path}"
    end

    raw_content = file.content
    if raw_content.nil?
      raise Inspec::Exceptions::ResourceSkipped, "Can't read file: #{path}"
    end

    if !allow_empty && raw_content.empty?
      raise Inspec::Exceptions::ResourceSkipped, "File is empty: #{path}"
    end

    raw_content
  end
end
