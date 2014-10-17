<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

Class Model_product extends CI_Model{

	function saveProductDetails($data){
		$this->db->insert('products', $data); 
	}

	function saveProductSales($data){
		$this->db->insert('sales',$data);
	}
	function saveSalesProducts($data){
		$this->db->insert('sales_products',$data);
	}

	function getProducts(){
		$query = $this->db->query("SELECT * from products");
		return $query->result();
	}

	 function getProductOptions(){
		$query = $this->db->query("SELECT * from products");	
        return $query->result();
    } 

    function getSales(){
		$query = $this->db->query("SELECT * from sales");
		return $query->result();
	}

	function getSalesProducts(){
		$query = $this->db->query("select a.id, b.Description, c.Name from sales_products a LEFT OUTER JOIN sales b On b.id = a.sales_id LEFT OUTER JOIN products c ON c.id = a.record_id");
		return $query->result();
	}

}

