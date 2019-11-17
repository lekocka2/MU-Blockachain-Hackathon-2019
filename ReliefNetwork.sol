pragma solidity ^0.5.2;

contract Blockathon {

    struct orgInfo {
        string orgName; //org name
        string orgCountryOrigin; //org home country
        string orgMailAddress; // org mailing address
        string orgContact; //administrative phone number
    }
   
    mapping(address => orgInfo) organizations;
    address[] private orgAccts;
    
    function addOrgNumber(address _address, string memory _orgName, string memory _orgCountryOrigin, string memory _orgMailAddress, 
        string memory _orgContact) public {
        
        orgInfo storage organization = organizations[_address];
        
        organization.orgName = _orgName;
        organization.orgCountryOrigin = _orgCountryOrigin;
        organization.orgMailAddress = _orgMailAddress;
        organization.orgContact = _orgContact;
        
        orgAccts.push(_address) -1;
    } //this maps org address to org account info
    
    function getOrgs() view public returns(address[] memory) {
        return orgAccts;
    } //this allows us to pull a list of all orgs
    
    function getOrg(address _address) view public returns (string memory, string memory, string memory) {
        return(organizations[_address].orgCountryOrigin, organizations[_address].orgMailAddress, organizations[_address].orgContact);
    } //this allows us to pull one specific org from inputting org name
   



    //////////////////////////////////////////////////////////////
    struct disasterInfo {
        string typeDisaster; //volcano, earthquake, hurricane, etc.
        string disasterStartDate; //start date of disaster
        string disasterEndDate; //end date of disaster
        string location; //city, country
        uint areaSize; //sq mileage of affected area
    }
    
    mapping(string => mapping(string => disasterInfo)) disasters;
    address[] private disasterAccts;
    
    function addDisaster(address _address, string memory _typeDisaster, string memory _disasterStartDate, string memory _disasterEndDate, 
        string memory _location, uint _areaSize) public {
        
        disasterInfo storage disaster = disasters[_location][_disasterStartDate];
        
        disaster.typeDisaster = _typeDisaster;
        disaster.disasterStartDate = _disasterStartDate;
        disaster.disasterEndDate = _disasterEndDate;
        disaster.location = _location;
        disaster.areaSize = _areaSize;
        
        disasterAccts.push(_address) -1;
    } //this maps disaster address to disaster info
    
    function getDisasters() view public returns(address[] memory) {
        return disasterAccts;
    } //this allows us to pull a list of all registered disasters
    
    function getDisaster(string memory _location, string memory _disasterStartDate) view public returns (string memory, string memory, uint) {
        disasterInfo memory disaster = disasters[_location][_disasterStartDate]; 
        return(disaster.typeDisaster, disaster.disasterEndDate, disaster.areaSize);
    } //this allows us to pull one specific disaster from inputting location and date of disaster
    



    //////////////////////////////////////////////////////////////
    struct projInfo {
        string organizName; //organization name leading the project
        string descrpProject; //description of disaster relief proj
        uint numPeople; //number of people working on site
        string contactName; //group leader name
        uint contactPhone; //group leader phone number
        uint amtFunding; //estimate amount of funding per disaster, in thousands
        string projStartDate; //anticipated start date of project (arrival at site)
        string projEndDate; //anticipated end date of project (departure from site)
        string projLocation; //city, country of project
    }
    
    mapping(string => mapping(string => mapping(string => projInfo))) projects;
    address[] private projectAccts;
    
    function addProject(address _address, string memory _organizName, string memory _descrpProject, uint _numPeople, string memory _contactName, 
        uint _contactPhone, uint _amtFunding, string memory _projStartDate, string memory _projEndDate, string memory _projLocation) public {
        
        projInfo storage project = projects[_organizName][_contactName][_projStartDate];
        
        project.organizName = _organizName;
        project.descrpProject = _descrpProject;
        project.numPeople = _numPeople;
        project.contactName = _contactName;
        project.contactPhone = _contactPhone;
        project.amtFunding = _amtFunding;
        project.projStartDate = _projStartDate;
        project.projEndDate = _projEndDate;
        project.projLocation = _projLocation;
        
        projectAccts.push(_address) -1;
    } //this maps project address to project info

    function getProjects() view public returns(address[] memory) {
        return projectAccts;
    } //this allows us to pull a list of all registered projects
    
    function getProject(string memory _organizName, string memory _contactName, string memory _projStartDate) public view 
        returns (string memory, uint, uint, uint, string memory, string memory) {
            
        projInfo memory project = projects[_organizName][_contactName][_projStartDate];
        return(
            project.descrpProject,
            project.numPeople,
            project.contactPhone,
            project.amtFunding,
            project.projEndDate, 
            project.projLocation
        );
    } //this allows us to pull one specific project from inputting organization name, contact name/project lead contact, and 
      //project anticipated start date
    
    
}
