module Block
    extend self

    def create(index, timestamp, data, prev_hash)
        block = {
            index: index,
            timestamp: timestamp,
            data: data,
            prev_hash: prev_hash
        }
        block.merge({ hash: self.calculate_hash(block)})
    end

    def calculate_hash(block)
        plain_text = "
            #{block[:index]}
            #{block[:timestamp]}
            #{block[:data]}
            #{block[:prev_hash]}
        "
        sha256 = OpenSSL::Digest.new("SHA256")
        sha256.update(plain_text)
        sha256.to_s
    end
end