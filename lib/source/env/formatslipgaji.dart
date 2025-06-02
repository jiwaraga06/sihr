class SlipGaji {
  static String htmlSlipGaji(data, nameMonth, year, img) {
    final pendapatanList = data.pendapatan!
        .map((e) => '<li class="d-flex justify-content-between"><span>${e.komponenGaji!.namaKomponen!}</span><span>Rp ${formatRupiah(e.nilai!)}</span></li>')
        .join();

    final potonganList = data.potongan!
        .map((e) => '<li class="d-flex justify-content-between"><span>${e.komponenGaji!.namaKomponen!}</span><span>Rp ${formatRupiah(e.nilai!)}</span></li>')
        .join();

    return """
<!DOCTYPE html>
<html lang="id">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Slip Gaji $nameMonth $year</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light py-4">
  <div class="container">
    <div class="card shadow-sm">
      <div class="card-body position-relative">
      <img src="data:image/png;base64,$img" alt="Logo" style="position: absolute; top: 50%; left: 50%; transform: translate(-50%, -50%); height: 300px; opacity: 0.1; z-index: 0;">

        <div class="d-flex justify-content-between align-items-center mb-3 border-bottom">
          <div>
            <h5 class="mb-0">${data.payroll[0].pegawai.nama}</h5>
            <small class="text-muted">${data.payroll[0].pegawai.jabatan.namaJabatan}</small>
          </div>
            
          <div><strong>$nameMonth $year</strong></div>
        </div>

        <div class="mb-4">
          <h6 class="text-secondary border-bottom pb-1">Pendapatan Gaji</h6>
          <ul class="list-unstyled">
            $pendapatanList
          </ul>
          <div class="d-flex justify-content-between border-top pt-2 fw-bold">
            <span>Total</span>
            <span>Rp ${formatRupiah(data.payroll![0].pendapatan!)}</span>
          </div>
        </div>

        <div class="mb-4">
          <h6 class="text-secondary border-bottom pb-1">Potongan Gaji</h6>
          <ul class="list-unstyled">
            $potonganList
          </ul>
          <div class="d-flex justify-content-between border-top pt-2 fw-bold">
            <span>Total</span>
            <span>Rp ${formatRupiah(data.payroll![0].potongan!)}</span>
          </div>
        </div>
        <div class="mb-4">
          <div class="d-flex justify-content-between border-top pt-2 fw-bold">
            <span>Total Gaji</span>
            <span>Rp ${formatRupiah(data.payroll![0].pendapatan! - data.payroll![0].potongan!)}</span>
          </div>
        </div>

      </div>
    </div>
  </div>
</body>
</html>
""";
  }

  static String formatRupiah(num value) {
    return value.toStringAsFixed(0).replaceAllMapped(RegExp(r'(\d)(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]}.');
  }
}
