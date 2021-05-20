<?php
require_once "classes/BaseMap.php";
class CategoriesMap extends BaseMap {
  public function findById($id) {
    $res = $this->db->query("SELECT * FROM murzalin_categories
    WHERE deleted_at IS NULL AND id=$id");
    $category = $res->fetch(PDO::FETCH_OBJ);
    if ($category) {
      return $category;
    }
    return new Category(); 
  }

  public function findAll() {
    $res = $this->db->query("SELECT * FROM murzalin_categories
    WHERE deleted_at IS NULL");
    $categories = $res->fetchAll(PDO::FETCH_OBJ);
    if ($categories) {
      return $categories;
    }
    return new Category(); 
  }

  public function save(Category $сategory) {
    if ($сategory->validate()) {
      if ($сategory->id == 0){
        return $this->insert($сategory->name, $category->parent_id);
      } else {
        return $this->update($сategory);
      }
    }
    return false;
  }

  private function insert($name, $parent_id) {
     if ($parent_id == NULL || $parent_id == 0 || $parent_id == "") {
      if ($this->db->exec("INSERT INTO murzalin_categories(`name`) VALUES('$name')") == 1) {
        return true;
      }
    } else {
      if ($this->db->exec("INSERT INTO murzalin_categories(`name`, `parent_id`) VALUES('$name', $parent_id)") == 1) {
        return true;
      }
    }
    return false;
    
  }

  private function update(Category $сategory) {  
    $parent_id = (int)$parent_id;
    if($parent_id == 0) {
      if ($this->db->exec("UPDATE murzalin_categories SET `name` = '$сategory->name' WHERE id=$сategory->id") == 1) {
        return true;
      }
    }
    if ($this->db->exec("UPDATE murzalin_categories SET `name` = '$сategory->name', parent_id = $сategory->parent_id WHERE id=$сategory->id") == 1) {
      return true;
    }
  }

  public function delete($id) {
    $data = date("Y-m-d H:i:s");
    if ($this->db->exec("UPDATE murzalin_categories SET deleted_at='$data' WHERE id=$id") == 1) {
      return true;
    }
    return false;
  }
}


