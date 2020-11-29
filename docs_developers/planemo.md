# Guide for to use Planemo

## `planemo lint`

`planemo lint` checks for common errors and best practices. It will check different criterias to know if the xml wrapper is in good shape.

Let's take an existing tool: "normalization"

```bash
$ cd ~/tools-metabolomicstools/normalization/
$ planemo lint .
Linting tool /private/tmp/tools-metabolomics/tools/normalization/NmrNormalization_xml.xml
Applying linter tests... CHECK
.. CHECK: 1 test(s) found.
Applying linter output... CHECK
.. INFO: 3 outputs found.
Applying linter inputs... CHECK
.. INFO: Found 8 input parameters.
Applying linter help... CHECK
.. CHECK: Tool contains help section.
.. CHECK: Help contains valid reStructuredText.
Applying linter general... CHECK
.. CHECK: Tool defines a version [1.0.7].
.. CHECK: Tool defines a name [Normalization].
.. CHECK: Tool defines an id [normalization].
.. CHECK: Tool targets 16.01 Galaxy profile.
Applying linter command... CHECK
.. INFO: Tool contains a command.
Applying linter citations... CHECK
.. CHECK: Found 1 likely valid citations.
Applying linter tool_xsd... CHECK
.. INFO: File validates against XML schema.
```

All seems good! Otherwise, you may to inverse some tags or complete others.

To complete this checking, you can have a look at the [IUC Best Practices](https://galaxy-iuc-standards.readthedocs.io/en/latest/best_practices/tool_xml.html)

## `planemo serve`
`planemo serve` launches Galaxy instance with specified tools.

### Import your test data in the history


## `planemo test`


