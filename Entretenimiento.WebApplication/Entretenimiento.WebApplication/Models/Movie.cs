using System;

namespace Entretenimiento.WebApplication.Models
{
    public class Movie : Production
    {
        public int DurationInMinutes { get; set; }
        public double WorldwideBoxOfficeGross { get; set; }
    }
}