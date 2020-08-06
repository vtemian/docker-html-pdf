# docker-html-pdf
Convert HTML to PDF using xhtml2pdf

```bash
mkdir html-to-pdf
echo "<html><body><p>To PDF or not to PDF</p></body></html>" > html-to-pdf/input.html
docker run -v $(pwd)/html-to-pdf:/opt/html-to-pdf vtemian/html-pdf
```
