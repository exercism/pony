primitive ToRNA
  fun apply(dna: String): String ? =>
    let rna = recover String(dna.size()) end
    for b in dna.values() do
      rna.push(match b
      | 'A' => 'U'
      | 'T' => 'A'
      | 'C' => 'G'
      | 'G' => 'C'
      else error
      end)
    end
    rna
