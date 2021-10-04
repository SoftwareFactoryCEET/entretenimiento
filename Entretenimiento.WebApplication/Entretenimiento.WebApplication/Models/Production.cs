using System;
using System.Collections.Generic;

namespace Entretenimiento.WebApplication.Models
{
    public abstract class Production
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public DateTime Release { get; set; }
        public List<Character> Characters { get; set; } = new List<Character>();
        public List<Rating> Ratings { get; set; } = new List<Rating>();
    }
}