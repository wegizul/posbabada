<?php

defined('BASEPATH') or exit('No direct script access allowed');

class Notes extends MY_Controller
{
    public function __construct()
    {
        parent::__construct();

        if (!$this->loggedIn) {
            $this->session->set_userdata('requested_page', $this->uri->uri_string());
            $this->sma->md('login');
        }
        if (!$this->Owner && !$this->Admin) {
            $this->session->set_flashdata('warning', lang('access_denied'));
            redirect($_SERVER['HTTP_REFERER']);
        }
        // $this->lang->admin_load('notes', $this->Settings->user_language);
        $this->load->library('form_validation');
        $this->load->admin_model('notes_model');
    }

    public function add()
    {
        $this->data['error'] = validation_errors() ? validation_errors() : $this->session->flashdata('error');
        $bc                  = [['link' => base_url(), 'page' => lang('home')], ['link' => '#', 'page' => 'Pesan Kasir']];
        $meta                = ['page_title' => 'Pesan Kasir', 'bc' => $bc];
        $this->page_construct('notes/add', $meta, $this->data);
    }

    public function simpan()
    {
        $username = $this->session->userdata('username');
        print_r(date('Y-m-d'));
        die();
        $data2 = [
            'nt_tanggal'   => date('Y-m-d'),
            'nt_username' => $username,
            'nt_nama' => $this->session->post('nt_nama'),
            'nt_note'     => $this->input->post('nt_note'),
            'nt_status'     => 1,
        ];

        if ($this->notes_model->addNotes($data2)) {
            $this->session->set_flashdata('message', lang('notification_added'));
            admin_redirect('notes');
        }
    }

    public function delete($id = null)
    {
        if (!$this->Owner) {
            $this->session->set_flashdata('warning', lang('access_denied'));
            redirect($_SERVER['HTTP_REFERER']);
        }
        if (!$id) {
            $this->sma->send_json(['error' => 1, 'msg' => lang('id_not_found')]);
        }

        if ($this->cmt_model->deleteComment($id)) {
            $this->sma->send_json(['error' => 0, 'msg' => lang('notifications_deleted')]);
        }
    }

    public function edit($id = null)
    {
        if (!$this->Owner) {
            $this->session->set_flashdata('warning', lang('access_denied'));
            die("<script type='text/javascript'>setTimeout(function(){ window.top.location.href = '" . ($_SERVER['HTTP_REFERER'] ?? site_url('welcome')) . "'; }, 10);</script>");
            exit;
        }

        if ($this->input->post('nt_id')) {
            $id = $this->input->post('nt_id');
        }

        $this->form_validation->set_rules('nt_note', lang('notifications'), 'required|min_length[3]');

        if ($this->form_validation->run() == true) {
            $data = [
                'nt_tanggal'   => date('Y-m-d'),
                'nt_username' => $this->session->userdata('username'),
                'nt_nama' => $this->session->post('nt_nama'),
                'nt_note'     => $this->input->post('nt_note'),
                'nt_status'     => 1,
            ];
        } elseif ($this->input->post('submit')) {
            $this->session->set_flashdata('error', validation_errors());
            admin_redirect('notes');
        }

        if ($this->form_validation->run() == true && $this->notes_model->updateNotes($id, $data)) {
            $this->session->set_flashdata('message', lang('notification_updated'));
            admin_redirect('notes');
        } else {
            $comment = $this->notes_model->getNotesByID($id);

            $this->data['nt_note'] = [
                'nt_note'    => 'nt_note',
                'id'         => 'nt_note',
                'type'       => 'textarea',
                'class'      => 'form-control',
                'required'   => 'required',
                'value'      => $this->form_validation->set_value('nt_note'),
            ];

            $this->data['nt_note'] = $comment;
            $this->data['id']           = $id;
            $this->data['modal_js']     = $this->site->modal_js();
            $this->data['error']        = validation_errors();
            $this->load->view($this->theme . 'notes/edit', $this->data);
        }
    }

    public function getNotes()
    {
        $this->load->library('datatables');
        $this->datatables
            ->select('nt_id, nt_tanggal, nt_nama, nt_note, nt_status')
            ->from('notes')
            ->add_column('Actions', "<div class=\"text-center\"><a href='" . admin_url('notes/edit/$1') . "' data-toggle='modal' data-target='#myModal' class='tip' title='" . lang('edit_notification') . "'><i class=\"fa fa-edit\"></i></a> <a href='#' class='tip po' title='<b>" . $this->lang->line('delete_notification') . "</b>' data-content=\"<p>" . lang('r_u_sure') . "</p><a class='btn btn-danger po-delete' href='" . admin_url('notes/delete/$1') . "'>" . lang('i_m_sure') . "</a> <button class='btn po-close'>" . lang('no') . "</button>\"  rel='popover'><i class=\"fa fa-trash-o\"></i></a></div>", 'id');
        $this->datatables->unset_column('nt_id');
        echo $this->datatables->generate();
    }

    public function index()
    {
        if (!$this->Owner && !$this->Admin) {
            $this->session->set_flashdata('warning', lang('access_denied'));
            redirect($_SERVER['HTTP_REFERER']);
        }

        $this->data['error'] = validation_errors() ? validation_errors() : $this->session->flashdata('error');
        $bc                  = [['link' => base_url(), 'page' => lang('home')], ['link' => '#', 'page' => 'Pesan Kasir']];
        $meta                = ['page_title' => 'Pesan Kasir', 'bc' => $bc];
        $this->page_construct('notes/index', $meta, $this->data);
    }
}
