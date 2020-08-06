import sys

from xhtml2pdf import pisa


def convert_html_to_pdf(source_html, output_filename):
    with open(output_filename, "w+b") as result_file:
        pisa_status = pisa.CreatePDF(source_html, dest=result_file)

    return pisa_status.err


if __name__ == "__main__":
    if len(sys.argv) != 3:
        print("re-render.py <html> <pdf>")
        sys.exit(1)

    pisa.showLogging()

    with open(sys.argv[1]) as source_html:
        convert_html_to_pdf(source_html.read(), sys.argv[2])
