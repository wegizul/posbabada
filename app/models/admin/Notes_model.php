<?php

defined('BASEPATH') or exit('No direct script access allowed');

class Notes_model extends CI_Model
{
    public function __construct()
    {
        parent::__construct();
    }

    public function addNotes($data)
    {
        if ($this->db->insert('notes', $data)) {
            return true;
        } else {
            return false;
        }
    }

    public function deleteNotes($id)
    {
        if ($this->db->delete('notes', ['nt_id' => $id])) {
            return true;
        }
        return false;
    }

    public function getAllNotes()
    {
        $q = $this->db->get('notes');
        if ($q->num_rows() > 0) {
            foreach (($q->result()) as $row) {
                $data[] = $row;
            }

            return $data;
        }
    }

    public function getNotes()
    {
        $q = $this->db->get_where('notes', ['nt_status' => 1], 1);
        if ($q->num_rows() > 0) {
            return $q->row();
        }
        return false;
    }

    public function getNotesByID($id)
    {
        $q = $this->db->get_where('notes', ['nt_id' => $id], 1);
        if ($q->num_rows() > 0) {
            return $q->row();
        }

        return false;
    }

    public function updateNotes($id, $data)
    {
        $this->db->where('nt_id', $id);
        if ($this->db->update('notes', $data)) {
            return true;
        } else {
            return false;
        }
    }
}
