components {
  id: "asteroid"
  component: "/main/asteroids/asteroid.script"
  position {
    x: 0.0
    y: 0.0
    z: 0.0
  }
  rotation {
    x: 0.0
    y: 0.0
    z: 0.0
    w: 1.0
  }
}
embedded_components {
  id: "collider"
  type: "collisionobject"
  data: "collision_shape: \"\"\n"
  "type: COLLISION_OBJECT_TYPE_DYNAMIC\n"
  "mass: 1.0\n"
  "friction: 0.1\n"
  "restitution: 0.5\n"
  "group: \"asteroid\"\n"
  "mask: \"ship\"\n"
  "mask: \"lazer\"\n"
  "mask: \"missile\"\n"
  "embedded_collision_shape {\n"
  "  shapes {\n"
  "    shape_type: TYPE_SPHERE\n"
  "    position {\n"
  "      x: 0.0\n"
  "      y: 0.0\n"
  "      z: 0.0\n"
  "    }\n"
  "    rotation {\n"
  "      x: 0.0\n"
  "      y: 0.0\n"
  "      z: 0.0\n"
  "      w: 1.0\n"
  "    }\n"
  "    index: 0\n"
  "    count: 1\n"
  "  }\n"
  "  data: 0.25\n"
  "}\n"
  "linear_damping: 0.0\n"
  "angular_damping: 0.0\n"
  "locked_rotation: false\n"
  "bullet: false\n"
  ""
  position {
    x: 0.0
    y: 0.0
    z: 0.0
  }
  rotation {
    x: 0.0
    y: 0.0
    z: 0.0
    w: 1.0
  }
}
embedded_components {
  id: "rock"
  type: "model"
  data: "mesh: \"/assets/glb/asteroids/asteroid7.glb\"\n"
  "material: \"/builtins/materials/model.material\"\n"
  "textures: \"/assets/images/brown.png\"\n"
  "skeleton: \"\"\n"
  "animations: \"\"\n"
  "default_animation: \"\"\n"
  "name: \"{{NAME}}\"\n"
  ""
  position {
    x: 0.0
    y: -0.125
    z: 0.0
  }
  rotation {
    x: 0.0
    y: 0.0
    z: 0.0
    w: 1.0
  }
}
embedded_components {
  id: "gold1"
  type: "model"
  data: "mesh: \"/assets/glb/asteroids/gold.glb\"\n"
  "material: \"/builtins/materials/model.material\"\n"
  "textures: \"/assets/glb/asteroids/gold.png\"\n"
  "skeleton: \"\"\n"
  "animations: \"\"\n"
  "default_animation: \"\"\n"
  "name: \"{{NAME}}\"\n"
  ""
  position {
    x: 0.15
    y: 0.0
    z: 0.0
  }
  rotation {
    x: 0.70710677
    y: 0.70710677
    z: 4.3297803E-17
    w: 4.3297803E-17
  }
}
embedded_components {
  id: "gold2"
  type: "model"
  data: "mesh: \"/assets/glb/asteroids/gold.glb\"\n"
  "material: \"/builtins/materials/model.material\"\n"
  "textures: \"/assets/glb/asteroids/gold.png\"\n"
  "skeleton: \"\"\n"
  "animations: \"\"\n"
  "default_animation: \"\"\n"
  "name: \"{{NAME}}\"\n"
  ""
  position {
    x: -0.16
    y: 0.0
    z: 0.0
  }
  rotation {
    x: 0.0
    y: 0.0
    z: 0.5891188
    w: 0.80804646
  }
}
embedded_components {
  id: "gold3"
  type: "model"
  data: "mesh: \"/assets/glb/asteroids/gold.glb\"\n"
  "material: \"/builtins/materials/model.material\"\n"
  "textures: \"/assets/glb/asteroids/gold.png\"\n"
  "skeleton: \"\"\n"
  "animations: \"\"\n"
  "default_animation: \"\"\n"
  "name: \"{{NAME}}\"\n"
  ""
  position {
    x: 0.0
    y: 0.14
    z: 0.0
  }
  rotation {
    x: 0.0
    y: 0.0
    z: 0.0
    w: 1.0
  }
}
embedded_components {
  id: "gold4"
  type: "model"
  data: "mesh: \"/assets/glb/asteroids/gold.glb\"\n"
  "material: \"/builtins/materials/model.material\"\n"
  "textures: \"/assets/glb/asteroids/gold.png\"\n"
  "skeleton: \"\"\n"
  "animations: \"\"\n"
  "default_animation: \"\"\n"
  "name: \"{{NAME}}\"\n"
  ""
  position {
    x: 0.0
    y: 0.0
    z: 0.17
  }
  rotation {
    x: 0.40557978
    y: 0.579228
    z: 0.40557978
    w: 0.579228
  }
}
embedded_components {
  id: "gold5"
  type: "model"
  data: "mesh: \"/assets/glb/asteroids/gold.glb\"\n"
  "material: \"/builtins/materials/model.material\"\n"
  "textures: \"/assets/glb/asteroids/gold.png\"\n"
  "skeleton: \"\"\n"
  "animations: \"\"\n"
  "default_animation: \"\"\n"
  "name: \"{{NAME}}\"\n"
  ""
  position {
    x: 0.0
    y: 0.0
    z: -0.2
  }
  rotation {
    x: 0.76975113
    y: 0.2801665
    z: 0.1961747
    w: 0.53898555
  }
}
embedded_components {
  id: "gold6"
  type: "model"
  data: "mesh: \"/assets/glb/asteroids/gold.glb\"\n"
  "material: \"/builtins/materials/model.material\"\n"
  "textures: \"/assets/glb/asteroids/gold.png\"\n"
  "skeleton: \"\"\n"
  "animations: \"\"\n"
  "default_animation: \"\"\n"
  "name: \"{{NAME}}\"\n"
  ""
  position {
    x: 0.0
    y: -0.15
    z: 0.0
  }
  rotation {
    x: 0.0
    y: 0.0
    z: 0.0
    w: 1.0
  }
}
