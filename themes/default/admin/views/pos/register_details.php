<?php defined('BASEPATH') or exit('No direct script access allowed'); ?>
<base href="<?= base_url() ?>" />
<meta http-equiv="cache-control" content="max-age=0" />
<meta http-equiv="cache-control" content="no-cache" />
<meta http-equiv="expires" content="0" />
<meta http-equiv="pragma" content="no-cache" />
<link rel="shortcut icon" href="<?= $assets ?>images/icon.png" />
<link rel="stylesheet" href="<?= $assets ?>styles/theme.css" type="text/css" />
<link rel="stylesheet" href="<?= $assets ?>styles/style.css" type="text/css" />
<link rel="stylesheet" href="<?= $assets ?>pos/css/posajax.css" type="text/css" />
<link rel="stylesheet" href="<?= $assets ?>pos/css/print.css" type="text/css" media="print" />
<link href="<?= base_url('assets/custom/pos.css') ?>" rel="stylesheet" />
<script type="text/javascript" src="<?= $assets ?>js/jquery-2.0.3.min.js"></script>
<script type="text/javascript" src="<?= $assets ?>js/jquery-migrate-1.2.1.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/remixicon@3.4.0/fonts/remixicon.css" rel="stylesheet">
<div class="modal-dialog">
    <div class="modal-content">
        <div class="modal-header">
            <a href="<?= base_url('admin/pos') ?>" class="close"><i class="fa fa-2x">&times;</i></a>
            <button type="button" class="btn btn-xs btn-default no-print pull-right" style="margin-right:15px;" onclick="window.print();">
                <i class="fa fa-print"></i> <?= lang('print'); ?>
            </button>
            <h4 class="modal-title" id="myModalLabel"><?= lang('sales') . ' (' . $this->sma->hrld($this->session->userdata('register_open_time')) . ' - ' . $this->sma->hrld(date('Y-m-d H:i:s')) . ')'; ?></h4>
        </div>
        <div class="modal-body">
            <p><?= lang('register_total_tip'); ?></p>
            <table width="100%" class="stable">
                <tr>
                    <td style="border-bottom: 1px solid #EEE;">
                        <h4><?= lang('cash_in_hand'); ?>:</h4>
                    </td>
                    <td style="text-align:right; border-bottom: 1px solid #EEE;">
                        <h4>
                            <span><?= $this->sma->formatMoney($this->session->userdata('cash_in_hand')); ?></span>
                        </h4>
                    </td>
                </tr>
                <tr>
                    <td style="border-bottom: 1px solid #EEE;">
                        <h4><?= lang('cash_sale'); ?>:</h4>
                    </td>
                    <td style="text-align:right; border-bottom: 1px solid #EEE;">
                        <h4>
                            <span><?= $this->sma->formatMoney($cashsales->paid ? $cashsales->paid : '0.00') . ' (' . $this->sma->formatMoney($cashsales->total ? $cashsales->total : '0.00') . ')'; ?></span>
                        </h4>
                    </td>
                </tr>
                <tr>
                    <td style="border-bottom: 1px solid #EEE;">
                        <h4>Pembayaran Dana :</h4>
                    </td>
                    <td style="text-align:right;border-bottom: 1px solid #EEE;">
                        <h4>
                            <span><?= $this->sma->formatMoney($dana->paid ? $dana->paid : '0.00') . ' (' . $this->sma->formatMoney($dana->total ? $dana->total : '0.00') . ')'; ?></span>
                        </h4>
                    </td>
                </tr>
                <tr>
                    <td style="border-bottom: 1px solid #EEE;">
                        <h4>Pembayaran ShopeePay :</h4>
                    </td>
                    <td style="text-align:right;border-bottom: 1px solid #EEE;">
                        <h4>
                            <span><?= $this->sma->formatMoney($shopee->paid ? $shopee->paid : '0.00') . ' (' . $this->sma->formatMoney($shopee->total ? $shopee->total : '0.00') . ')'; ?></span>
                        </h4>
                    </td>
                </tr>
                <tr>
                    <td style="border-bottom: 1px solid #EEE;">
                        <h4>Pembayaran GoFood :</h4>
                    </td>
                    <td style="text-align:right;border-bottom: 1px solid #EEE;">
                        <h4>
                            <span><?= $this->sma->formatMoney($gofood->paid ? $gofood->paid : '0.00') . ' (' . $this->sma->formatMoney($gofood->total ? $gofood->total : '0.00') . ')'; ?></span>
                        </h4>
                    </td>
                </tr>
                <tr>
                    <td style="border-bottom: 1px solid #EEE;">
                        <h4>Pembayaran OVO :</h4>
                    </td>
                    <td style="text-align:right;border-bottom: 1px solid #EEE;">
                        <h4>
                            <span><?= $this->sma->formatMoney($ovo->paid ? $ovo->paid : '0.00') . ' (' . $this->sma->formatMoney($ovo->total ? $ovo->total : '0.00') . ')'; ?></span>
                        </h4>
                    </td>
                </tr>
                <tr>
                    <td style="border-bottom: 1px solid #EEE;">
                        <h4>Pembayaran QRIS :</h4>
                    </td>
                    <td style="text-align:right;border-bottom: 1px solid #EEE;">
                        <h4>
                            <span><?= $this->sma->formatMoney($qris->paid ? $qris->paid : '0.00') . ' (' . $this->sma->formatMoney($qris->total ? $qris->total : '0.00') . ')'; ?></span>
                        </h4>
                    </td>
                </tr>
                <?php if ($pos_settings->paypal_pro) {
                ?>
                    <tr>
                        <td style="border-bottom: 1px solid #EEE;">
                            <h4><?= lang('paypal_pro'); ?>:</h4>
                        </td>
                        <td style="text-align:right;border-bottom: 1px solid #EEE;">
                            <h4>
                                <span><?= $this->sma->formatMoney($pppsales->paid ? $pppsales->paid : '0.00') . ' (' . $this->sma->formatMoney($pppsales->total ? $pppsales->total : '0.00') . ')'; ?></span>
                            </h4>
                        </td>
                    </tr>
                <?php
                } ?>
                <?php if ($pos_settings->stripe) {
                ?>
                    <tr>
                        <td style="border-bottom: 1px solid #EEE;">
                            <h4><?= lang('stripe'); ?>:</h4>
                        </td>
                        <td style="text-align:right;border-bottom: 1px solid #EEE;">
                            <h4>
                                <span><?= $this->sma->formatMoney($stripesales->paid ? $stripesales->paid : '0.00') . ' (' . $this->sma->formatMoney($stripesales->total ? $stripesales->total : '0.00') . ')'; ?></span>
                            </h4>
                        </td>
                    </tr>
                <?php
                } ?>
                <?php if ($pos_settings->authorize) {
                ?>
                    <tr>
                        <td style="border-bottom: 1px solid #DDD;">
                            <h4><?= lang('authorize'); ?>:</h4>
                        </td>
                        <td style="text-align:right;border-bottom: 1px solid #DDD;">
                            <h4>
                                <span><?= $this->sma->formatMoney($authorizesales->paid ? $authorizesales->paid : '0.00') . ' (' . $this->sma->formatMoney($authorizesales->total ? $authorizesales->total : '0.00') . ')'; ?></span>
                            </h4>
                        </td>
                    </tr>
                <?php
                } ?>
                <tr>
                    <td width="300px;" style="font-weight:bold;">
                        <h4><?= lang('total_sales'); ?>:</h4>
                    </td>
                    <td width="200px;" style="font-weight:bold;text-align:right;">
                        <h4>
                            <span><?= $this->sma->formatMoney($totalsales->paid ? $totalsales->paid : '0.00') . ' (' . $this->sma->formatMoney($totalsales->total ? $totalsales->total : '0.00') . ')'; ?></span>
                        </h4>
                    </td>
                </tr>
                <tr>
                    <td style="border-top: 1px solid #DDD;">
                        <h4><?= lang('refunds'); ?>:</h4>
                    </td>
                    <td style="text-align:right;border-top: 1px solid #DDD;">
                        <h4>
                            <span><?= $this->sma->formatMoney($refunds->returned ? $refunds->returned : '0.00') . ' (' . $this->sma->formatMoney($refunds->total ? $refunds->total : '0.00') . ')'; ?></span>
                        </h4>
                    </td>
                </tr>
                <tr>
                    <td style="border-top: 1px solid #DDD;">
                        <h4><?= lang('returns'); ?>:</h4>
                    </td>
                    <td style="text-align:right;border-top: 1px solid #DDD;">
                        <h4>
                            <span><?= $this->sma->formatMoney($returns->total ? '-' . $returns->total : '0.00'); ?></span>
                        </h4>
                    </td>
                </tr>
                <tr>
                    <td style="border-bottom: 1px solid #DDD;">
                        <h4><?= lang('expenses'); ?>:</h4>
                    </td>
                    <td style="text-align:right;border-bottom: 1px solid #DDD;">
                        <h4>
                            <span><?php $expense = $expenses ? $expenses->total : 0;
                                    echo $this->sma->formatMoney($expense) . ' (' . $this->sma->formatMoney($expense) . ')'; ?></span>
                        </h4>
                    </td>
                </tr>
                <tr>
                    <td width="300px;" style="font-weight:bold;">
                        <h4><strong><?= lang('total_cash'); ?></strong>:</h4>
                    </td>
                    <td style="text-align:right;">
                        <h4>
                            <span><strong><?= $cashsales->paid ? $this->sma->formatMoney(($cashsales->paid + ($this->session->userdata('cash_in_hand'))) + ($refunds->returned ? $refunds->returned : 0) - ($returns->total ? $returns->total : 0) - $expense) : $this->sma->formatMoney($this->session->userdata('cash_in_hand') - $expense - ($returns->total ? $returns->total : 0)); ?></strong></span>
                        </h4>
                    </td>
                </tr>
            </table>
        </div>
    </div>

</div>