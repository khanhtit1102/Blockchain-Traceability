function downloadSVG() {
    const svg = document.getElementById('qrcode').innerHTML;
    const blob = new Blob([svg.toString()]);
    const element = document.createElement("a");
    element.download = "QRCode.svg";
    element.href = window.URL.createObjectURL(blob);
    element.click();
    element.remove();
}