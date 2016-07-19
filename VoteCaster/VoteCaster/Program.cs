using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace VoteCaster
{
    class Program
    {
        
        static void Main(string[] args)
        {
            List<string> listOfCandidates = new List<string>();
            listOfCandidates.Add("Jack");
            listOfCandidates.Add("Jill");
            Console.WriteLine("Please enter a UNIQUE boothID");
            string boothID = Console.ReadLine();
            VoteCaster thisVoteCaster = new VoteCaster(boothID,listOfCandidates);
            thisVoteCaster.DisplayCandidates();

            while(true)
            {

                thisVoteCaster.CastVote();
            }
        }



    }
}
