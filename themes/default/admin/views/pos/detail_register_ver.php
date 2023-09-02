<?php defined('BASEPATH') or exit('No direct script access allowed'); ?>
<div class="modal-dialog modal-sm">
    <div class="modal-content">
        <div class="modal-header" style="margin-bottom: 5px;">
            <button type="button" class="close" data-dismiss="modal" aria-hidden="true"><i class="fa fa-2x">&times;</i>
            </button>
            <h4 class="modal-title">
                Input Password Register Detail
            </h4>
        </div>
        <?php $attrib = ['data-toggle' => 'validator', 'role' => 'form'];
        echo admin_form_open_multipart('pos/register_details_process', $attrib);
        ?>
        <div class="model-body" style="padding-bottom: 20px;">
            <div class="col-lg-12">
                <?= form_hidden('pass_hiden', $pass_dr ?? 0); ?>
                <input type="password" class="form-control" id="pass_dr" name="pass_dr" autocomplete="off" required>
            </div>
        </div>
        <div class="modal-footer no-print" style="margin-top: 35px;">
            <button class="btn btn-primary" type="submit">Verifikasi</button>
        </div>
        <?= form_close(); ?>
    </div>
</div>