cwlVersion: v1.0
steps:
  read-potential-cases-fhir:
    run: read-potential-cases-fhir.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule1
  ccu002_01-thrombocytopenia-thrombocytopaenia---secondary:
    run: ccu002_01-thrombocytopenia-thrombocytopaenia---secondary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule2
      potentialCases:
        id: potentialCases
        source: read-potential-cases-fhir/output
  ccu002_01-thrombocytopenia-history---secondary:
    run: ccu002_01-thrombocytopenia-history---secondary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule3
      potentialCases:
        id: potentialCases
        source: ccu002_01-thrombocytopenia-thrombocytopaenia---secondary/output
  ccu002_01-thrombocytopenia-blood---secondary:
    run: ccu002_01-thrombocytopenia-blood---secondary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule4
      potentialCases:
        id: potentialCases
        source: ccu002_01-thrombocytopenia-history---secondary/output
  ccu002_01-thrombocytopenia---secondary:
    run: ccu002_01-thrombocytopenia---secondary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule5
      potentialCases:
        id: potentialCases
        source: ccu002_01-thrombocytopenia-blood---secondary/output
  ccu002_01-thrombocytopenia-acquired---secondary:
    run: ccu002_01-thrombocytopenia-acquired---secondary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule6
      potentialCases:
        id: potentialCases
        source: ccu002_01-thrombocytopenia---secondary/output
  ccu002_01-thrombocytopenia-associated---secondary:
    run: ccu002_01-thrombocytopenia-associated---secondary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule7
      potentialCases:
        id: potentialCases
        source: ccu002_01-thrombocytopenia-acquired---secondary/output
  defective-ccu002_01-thrombocytopenia---secondary:
    run: defective-ccu002_01-thrombocytopenia---secondary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule8
      potentialCases:
        id: potentialCases
        source: ccu002_01-thrombocytopenia-associated---secondary/output
  hereditary-ccu002_01-thrombocytopenia---secondary:
    run: hereditary-ccu002_01-thrombocytopenia---secondary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule9
      potentialCases:
        id: potentialCases
        source: defective-ccu002_01-thrombocytopenia---secondary/output
  ccu002_01-thrombocytopenia-specified---secondary:
    run: ccu002_01-thrombocytopenia-specified---secondary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule10
      potentialCases:
        id: potentialCases
        source: hereditary-ccu002_01-thrombocytopenia---secondary/output
  output-cases:
    run: output-cases.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule11
      potentialCases:
        id: potentialCases
        source: ccu002_01-thrombocytopenia-specified---secondary/output
class: Workflow
inputs:
  inputModule1:
    id: inputModule1
    doc: Js implementation unit
    type: File
  inputModule2:
    id: inputModule2
    doc: Python implementation unit
    type: File
  inputModule3:
    id: inputModule3
    doc: Python implementation unit
    type: File
  inputModule4:
    id: inputModule4
    doc: Python implementation unit
    type: File
  inputModule5:
    id: inputModule5
    doc: Python implementation unit
    type: File
  inputModule6:
    id: inputModule6
    doc: Python implementation unit
    type: File
  inputModule7:
    id: inputModule7
    doc: Python implementation unit
    type: File
  inputModule8:
    id: inputModule8
    doc: Python implementation unit
    type: File
  inputModule9:
    id: inputModule9
    doc: Python implementation unit
    type: File
  inputModule10:
    id: inputModule10
    doc: Python implementation unit
    type: File
  inputModule11:
    id: inputModule11
    doc: Python implementation unit
    type: File
outputs:
  cases:
    id: cases
    type: File
    outputSource: output-cases/output
    outputBinding:
      glob: '*.csv'
requirements:
  SubworkflowFeatureRequirement: {}
