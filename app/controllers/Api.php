<?php
defined('BASEPATH') or exit('No direct script access allowed');

class Api extends CI_Controller
{
    function __construct()
    {
        parent::__construct();
        date_default_timezone_set('Asia/Jakarta');
    }

    public function getCustomer()
    {
        if ($_SERVER['REQUEST_METHOD'] === 'GET') {
            $data = $this->site->getAllCompany();

            $json_data = json_encode($data);

            header('Content-Type: application/json');
            header('Access-Control-Allow-Origin: *');
            echo $json_data;
        } else {
            http_response_code(405);
            echo json_encode(array('message' => 'Method Not Allowed'));
        }
    }

    public function findCustomer($id)
    {
        if ($_SERVER['REQUEST_METHOD'] === 'GET') {
            $data = $this->site->getCompanyByID($id);

            $json_data = json_encode($data);

            header('Content-Type: application/json');
            header('Access-Control-Allow-Origin: *');
            echo $json_data;
        } else {
            http_response_code(405);
            echo json_encode(array('message' => 'Method Not Allowed'));
        }
    }
}
