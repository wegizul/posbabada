<!-- Font Awesome Icons -->
<script src="https://kit.fontawesome.com/c1fd40eeb3.js" crossorigin="anonymous"></script>
<div class="box">
    <div class="box-header">
        <h2 class="blue"><i class="fas fa fa-plus-circle"></i><?= lang('add_purchase'); ?></h2>
    </div>
    <div class="box-content">
        <div class="row">
            <div class="col-lg-12">
                <form role="form col-lg" name="Penjualan" id="frm_penjualan">
                    <div class="card-body form">
                        <div class="row">
                            <input type="hidden" id="pjl_id" name="pjl_id" value="">
                            <input type="hidden" id="pjl_user" name="pjl_user" value="<?= $this->session->userdata('user_id') ?>">
                            <input type="hidden" id="pjl_customer" name="pjl_customer" value="<?= $warehouses->name ?>">
                            <input type="hidden" id="pjl_jenis_harga" name="pjl_jenis_harga" value="1">
                            <input type="hidden" id="pjl_status_bayar" name="pjl_status_bayar" value="0">
                            <input type="hidden" id="pjl_status" name="pjl_status" value="1">
                            <div class="col-lg-4">
                                <label>Tanggal</label> <span class="text-danger">*</span>
                                <div class="input-group wide-tip">
                                    <div class="input-group-addon" style="padding-left: 10px; padding-right: 10px;">
                                        <span class="input-group-text"><i class="fas fa-calendar-days"></i></span>
                                    </div>
                                    <input type="date" class="form-control form-control-sm" name="pjl_tanggal" id="pjl_tanggal" autocomplete="off" required>
                                </div>
                            </div>
                            <div class="col-lg-3">
                                <div class="form-group">
                                    <label>Tipe Pembayaran</label>
                                    <select class="form-control form-control-sm" name="pjl_jenis_bayar" id="pjl_jenis_bayar">
                                        <option value="1">Transfer</option>
                                        <option value="2">Cash</option>
                                    </select>
                                </div>
                            </div>
                            <hr width="100%">
                            <div class="col-lg-4">
                                <div class="form-group">
                                    <label style="font-size: medium;"><b>Detail Barang</b></label>
                                </div>
                            </div>
                            <div class="col-lg-8">
                                <select class="form-control" id="material" onChange="cari_material(this.value)" autofocus>
                                    <option value="">Pilih Item</option>
                                </select>
                            </div>
                            <div class="col-lg-12" style="margin-top: 20px;">
                                <div class="form-group">
                                    <table class="table" style="margin-bottom:0px;">
                                        <tr>
                                            <th width="45%">Item <span class="text-danger">*</span></th>
                                            <th width="30%">Qty <span class="text-danger">*</span></th>
                                            <th width="20%">Satuan <span class="text-danger">*</span></th>
                                            <th></th>
                                        </tr>
                                    </table>
                                    <table class="table" id="list_item">
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="card-footer">
                        <div class="col-lg-12" style="float:right;">
                            <button type="submit" id="pjl_simpan" class="btn btn-primary" style="float: right;"><i class="fas fa-paper-plane"></i> Kirim</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

<script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js" integrity="sha512-AA1Bzp5Q0K1KanKKmvN/4d3IRKVlv9PYgwFPvm32nPO6QS8yH1HO7LbgB1pgiOxPtfeg5zEn2ba64MUcqJx6CA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>

<script>
    document.addEventListener('DOMContentLoaded', function() {
        // Mengambil data dari API menggunakan fetch
        fetch('http://localhost/babada-logistik/Api/getMaterial')
            .then(response => response.json())
            .then(data => {
                // Memproses data yang diterima
                var select = document.getElementById('material');
                data.forEach(product => {
                    var opt = document.createElement('option');
                    opt.value = product.mtl_id;
                    opt.innerHTML = product.mtl_nama;
                    select.appendChild(opt);
                });
            })
            .catch(error => {
                console.error('Error fetching data:', error);
            });
    });

    function cari_material(id) {
        event.preventDefault();
        $.ajax({
            type: "POST",
            url: "http://localhost/babada-logistik/Api/findMaterial",
            data: "mtl_id=" + id,
            dataType: "json",
            success: function(data) {
                tambah(data);
                return false;
            }
        });
    }

    var i = 1;

    function tambah(val) {
        i++;
        $('#list_item').append('<tr id="row' + i + '">' +
            `<td width="45%">
				` + val.mtl_nama + `
				<input type="hidden" id="pjd_mtl_id` + i + `" name="pjd_mtl_id[]" value="` + val.mtl_id + `" class="form-control form-control-sm" readonly>
			</td>
			<td width="30%">
				<input type="number" min="0" id="pjd_qty` + i + `" name="pjd_qty[]" class="form-control form-control-sm" style="width:50%;" required>
			</td>
			<td width="20%">
				` + val.smt_nama + `
				<input type="hidden" id="pjd_smt_id` + i + `" name="pjd_smt_id[]" value="` + val.smt_id + `" class="form-control form-control-sm">
			</td>
			<td>
			<span name="hapus" id="` + i + `" class="hapus"><i class="fas fa-trash-alt"></i></span></td>` +
            '</tr>'
        );
    }

    $(document).on('click', '.hapus', function() {
        i--;
        var btn_hapus = $(this).attr("id");
        $('#row' + btn_hapus + '').remove();
    });

    $("#frm_penjualan").submit(function(e) {
        e.preventDefault();
        $("#pjl_simpan").html("Menyimpan...");
        $(".btn").attr("disabled", true);
        $.ajax({
            type: "POST",
            url: "http://localhost/babada-logistik/Api/sendPurchase",
            data: new FormData(this),
            processData: false,
            contentType: false,
            success: function(d) {
                var res = JSON.parse(d);
                if (res.status == 1) {
                    swal(
                        'Sukses',
                        res.desc,
                        'success'
                    ).then((result) => {
                        if (!result.isConfirmed) {
                            window.location.reload("<?= admin_url('purchases'); ?>");
                            reset_form();
                        } else {}
                    })
                } else {
                    toastr.error(res.desc);
                }
                $("#pjl_simpan").html("<i class='fas fa-check-circle'></i> Simpan");
                $(".btn").attr("disabled", false);
            },
            error: function(jqXHR, namaStatus, errorThrown) {
                $("#pjl_simpan").html("Error");
                $(".btn").attr("disabled", false);
                alert('Error get data from ajax');
            }
        });
    });
</script>