<?php
class Category {
  public $id = 0;
  public $name = "";
  public $parent_id = NULL;

  public function validate(){
    if(true){
      return true;
    }
    return false;
  }
  public function __construct(int $id, string $name, $parent_id) {
    $this->id = $id;
    $this->name = $name;
    $this->parent_id = $parent_id;
  }
}