
#will parse filenames in the db/mp3s folder
#and send the filenames to the Song class
class MP3Importer
  attr_accessor :songs, :path

  def initialize(path)
    @path = path
  end

  def files
    Dir.entries(path).select { |x| x[/\.mp3$/] }
  end

  def import
    i = 0
    while i < self.files.length
      Song.new_by_filename(self.files[i])
      i += 1
    end
  end
end