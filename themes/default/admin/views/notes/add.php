<?php defined('BASEPATH') or exit('No direct script access allowed'); ?>
<div class="box">
    <div class="box-header">
        <h2 class="blue"><i class="fa-fw fa fa-info-circle"></i><?= lang('notifications'); ?></h2>
    </div>
    <?php $attrib = ['role' => 'form'];
    echo admin_form_open('notes/simpan', $attrib); ?>
    <div class="box-content">

        <div class="row">
            <div class="col-sm-6">
                <div class="form-group">
                    <?php echo lang('Judul', 'Judul'); ?>
                    <div class="controls">
                        <?php echo form_input('nt_nama', '', 'class="form-control" id="nt_nama" required="required"'); ?>
                    </div>
                </div>
            </div>
            <div class="col-sm-6">
                <div class="form-group">
                    <?php echo lang('Status', 'Status'); ?>
                    <div class="controls">
                        <select class="form-control" name="nt_status" id="nt_status">
                            <option value="1">Aktif</option>
                            <option value="0">Tidak Aktif</option>
                        </select>
                    </div>
                </div>
            </div>
        </div>

        <div class="form-group">
            <?php echo lang('Catatan', 'Catatan'); ?>
            <div class="controls">
                <textarea name="nt_note" id="nt_note" class="form-control" rows="5"></textarea>
            </div>
        </div>
        <button type="submit" class="btn btn-primary" id="simpan">Simpan Catatan</button>
    </div>
    <?php echo form_close(); ?>
</div>