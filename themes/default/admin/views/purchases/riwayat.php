<!-- Font Awesome Icons -->
<script src="https://kit.fontawesome.com/c1fd40eeb3.js" crossorigin="anonymous"></script>
<div class="box">
    <div class="box-header">
        <h2 class="blue"><i class="fas fa fa-plus-circle"></i><?= lang('add_purchase'); ?></h2>
    </div>
    <div class="box-content">
        <div class="row">
            <div class="col-lg-12">
                <div class="card-body">
                    <div class="input-group" style="float: right; width:20%; margin-bottom:5px;">
                        <div class="input-group-addon" style="padding: 0px 15px 0px 15px;">
                            <span class="input-group-text"><i class="fas fa-search"></i></span>
                        </div>
                        <input type="text" name="search" id="search" onKeyup="cari_invoice(this.value)" class="form-control">
                    </div>
                    <table class="table table-striped table-bordered table-hover" id="tabel-data" width="100%" style="font-size:100%;">
                        <thead>
                            <tr>
                                <th style="width: 5%;">No</th>
                                <th>Tanggal</th>
                                <th>Invoice</th>
                                <th>Customer</th>
                                <th>Total Item</th>
                                <th>Jumlah Bayar</th>
                                <th>Pembayaran</th>
                                <th>Status</th>
                                <th>Aksi</th>
                            </tr>
                        </thead>
                        <tbody id="isi">
                            <?php $no = 1;
                            foreach ($penjualan as $pjl) {
                                $status = '';
                                $pembayaran = '';
                                switch ($pjl['pjl_status']) {
                                    case 1:
                                        $status = "<span class='badge badge-warning'>Menunggu Konfirmasi</span>";
                                        break;
                                    case 2:
                                        $status = "<span class='badge badge-success'>Dikonfirmasi</span>";
                                        break;
                                    case 3:
                                        $status = "<span class='badge badge-danger'>Ditolak</span>";
                                        break;
                                    case 4:
                                        $status = "<span class='badge badge-success'>Selesai</span>";
                                        break;
                                }
                                switch ($pjl['pjl_status_bayar']) {
                                    case 0:
                                        $pembayaran = "<span class='badge badge-warning'>Tertunda</span>";
                                        break;
                                    case 1:
                                        $pembayaran = "<span class='badge badge-danger'>Jatuh Tempo</span>";
                                        break;
                                    case 2:
                                        $pembayaran = "<span class='badge badge-success'>Lunas</span>";
                                        break;
                                } ?>
                                <tr>
                                    <td><?= $no++ ?></td>
                                    <td><?= $pjl['pjl_tanggal'] ?></td>
                                    <td><?= $pjl['pjl_faktur'] ?></td>
                                    <td><?= $pjl['pjl_customer'] ?></td>
                                    <td><?= $pjl['pjl_total_item'] ?></td>
                                    <td>Rp <?= number_format($pjl['pjl_jumlah_bayar'], 0, '.', ',') ?></td>
                                    <td><?= $pembayaran ?></td>
                                    <td><?= $status ?></td>
                                    <td><?= $pjl['pjl_status'] ?></td>
                                </tr>
                            <?php } ?>
                        </tbody>
                    </table>
                </div>
                <div class="card-footer">
                </div>
            </div>
        </div>
    </div>
</div>

<script>
    function cari_invoice(nomor) {
        event.preventDefault();
        $.ajax({
            type: "POST",
            url: "http://localhost/ilogs/Api/findInvoice",
            data: "pjl_faktur=" + nomor,
            dataType: "json",
            success: function(data) {
                $('#isi').html(data);
                return false;
            }
        });
    }
</script>