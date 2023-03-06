require('neogen').setup {
    enabled = true,
	  languages = {
	    go = {
	        template = {
              annotation_convention = "godoc",
          }
	    },
	    python = {
	        template = {
              annotation_convention = "reST",
          }
	    },
	    rust = {
	    	template = {
	    	      annotation_convention = "rustdoc"
          }
	    },
    }
}
