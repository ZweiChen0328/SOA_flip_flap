# frozen_string_literal: true

# Module that can be included (mixin) to take and output TSV data
module TsvBuddy
  # take_tsv: converts a String with TSV data into @data
  # parameter: tsv - a String in TSV format
  def take_tsv(tsv)
    rows = tsv.split("\n").map { |line| line.split("\t") }
    headers = rows.first
    data = rows[1..]
    @data = data.map do |row|
      row.map.with_index { |cell, i| [headers[i], cell] }.to_h
    end
  end

  # to_tsv: converts @data into tsv string
  # returns: String in TSV format
  def to_tsv
    headers = @data[0].keys
    result = @data.map(&:values)
    result.insert(0, headers)
    result = result.map { |line| line.join("\t") }.join("\n")
    result << "\n"
  end
end
