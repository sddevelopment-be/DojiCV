examples := "serious playful contractor"

# Build all example CVs into examples/ (including a GDPR-redacted contractor CV)
build:
    for name in {{examples}}; do typst compile src/${name}_example.typ examples/${name}_example.pdf || exit 1; done
    typst compile --input gdpr=true src/contractor_example.typ examples/contractor_example_GDPR.pdf

# Recompile a CV on every change, e.g. `just watch playful`
watch name="serious":
    typst watch src/{{name}}_example.typ examples/{{name}}_example.pdf
