module Timetrap
  module Formatters
    class Tags
      attr_reader :output

      def initialize entries
        @output = entries.inject("start,end,sheet,tag,note\n") do |out, e|
          next(out) unless e.end
          if e.note.include? ": "
              tag = e.note.split(": ").first
              note = e.note.split(": ").last
          else
              tag = ""
              note = e.note
          end
          out << %|"#{e.start.strftime(time_format)}","#{e.end.strftime(time_format)}","#{e.sheet}","#{tag}","#{note}"\n|
        end
      end

      private
      def time_format
        "%Y-%m-%d %H:%M:%S"
      end
    end
  end
end
